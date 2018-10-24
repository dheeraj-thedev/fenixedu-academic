/**
 * Copyright © 2002 Instituto Superior Técnico
 *
 * This file is part of FenixEdu Academic.
 *
 * FenixEdu Academic is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu Academic is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu Academic.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.fenixedu.academic.domain.contacts;

import java.util.Comparator;

import org.apache.commons.lang.StringUtils;
import org.fenixedu.PostalCodeValidator;
import org.fenixedu.academic.domain.Country;
import org.fenixedu.academic.domain.Person;
import org.fenixedu.academic.domain.exceptions.DomainException;
import org.fenixedu.academic.domain.organizationalStructure.Party;
import org.fenixedu.academic.predicate.AccessControl;
import org.fenixedu.academic.util.Bundle;
import org.fenixedu.bennu.core.i18n.BundleUtil;
import org.joda.time.DateTime;

import pt.ist.fenixframework.Atomic;

public class PhysicalAddress extends PhysicalAddress_Base {

    static {
        setResolver(PhysicalAddress.class, (pc) -> ((PhysicalAddress) pc).getAddress());
    }

    public static Comparator<PhysicalAddress> COMPARATOR_BY_ADDRESS = new Comparator<PhysicalAddress>() {
        @Override
        public int compare(PhysicalAddress contact, PhysicalAddress otherContact) {
            final String address = contact.getAddress();
            final String otherAddress = otherContact.getAddress();
            int result = 0;
            if (address != null && otherAddress != null) {
                result = address.compareTo(otherAddress);
            } else if (address != null) {
                result = 1;
            } else if (otherAddress != null) {
                result = -1;
            }
            return result == 0 ? COMPARATOR_BY_TYPE.compare(contact, otherContact) : result;
        }
    };

    public static Comparator<PhysicalAddress> COMPARATOR_BY_RELEVANCE = (a1, a2) -> {
        final boolean d1 = a1.getDefaultContact();
        final boolean d2 = a2.getDefaultContact();
        final boolean ac1 = a1.getActive();
        final boolean ac2 = a2.getActive();
            // some addresses don't have an associated country and that is relevant for the postal codes
        final Country c1 = a1.getCountryOfResidence();
        final Country c2 = a2.getCountryOfResidence();
        return (c1 != null && c2 == null) ? -1 : 
            ((c2 != null && c1 == null) ? 1 :
                ((ac1 && !ac2) ? -1 :
                    (ac2 && !ac1) ? 1 : 
                        ((d1 && !d2) ? -1 :
                            (d2 && !d1) ? 1 :
                                a1.getExternalId().compareTo(a2.getExternalId()))));
    };

    static public PhysicalAddress createPhysicalAddress(final Party party, final PhysicalAddressData data, PartyContactType type,
            Boolean isDefault) {
        return new PhysicalAddress(party, type, isDefault, data);
    }

    protected PhysicalAddress() {
        super();
        new PhysicalAddressValidation(this);
    }

    protected PhysicalAddress(final Party party, final PartyContactType type, final boolean defaultContact,
            PhysicalAddressData data) {
        this();
        super.init(party, type, defaultContact);
        setVisibleToPublic(Boolean.FALSE);
        setVisibleToStudents(Boolean.FALSE);
        setVisibleToStaff(Boolean.FALSE);
        edit(data);
    }

    // Called from renders with constructor clause.
    public PhysicalAddress(final Party party, final PartyContactType type, final Boolean defaultContact, final String address,
            final String areaCode, final String areaOfAreaCode, final String area, final String parishOfResidence,
            final String districtSubdivisionOfResidence, final String districtOfResidence, final Country countryOfResidence) {
        this(party, type, defaultContact.booleanValue(), new PhysicalAddressData(address, areaCode, areaOfAreaCode, area,
                parishOfResidence, districtSubdivisionOfResidence, districtOfResidence, countryOfResidence));
    }

    public void edit(final PhysicalAddressData data) {
        if (data == null) {
            return;
        }
        if (!data.equals(new PhysicalAddressData(this))) {
            final Country country = data.getCountryOfResidence();
            if (country == null) {
                throw new DomainException("label.address.invalid.no.country");
            }
            final String areaCode = data.getAreaCode();
            if (areaCode == null || !PostalCodeValidator.isValidAreaCode(country.getCode(), areaCode)) {
                throw new DomainException("label.address.invalid.postCode.for.country", areaCode, country.getCode(),
                        PostalCodeValidator.examplePostCodeFor(country.getCode()));
            }
            setAddress(data.getAddress());
            setAreaCode(areaCode);
            setAreaOfAreaCode(data.getAreaOfAreaCode());
            setArea(data.getArea());
            setParishOfResidence(data.getParishOfResidence());
            setDistrictSubdivisionOfResidence(data.getDistrictSubdivisionOfResidence());
            setDistrictOfResidence(data.getDistrictOfResidence());
            setCountryOfResidence(country);
            if (!waitsValidation()) {
                new PhysicalAddressValidation(this);
            }
            setLastModifiedDate(new DateTime());
        }

    }

    // Called from renders with edit clause.
    public void edit(final PartyContactType type, final Boolean defaultContact, final String address, final String areaCode,
            final String areaOfAreaCode, final String area, final String parishOfResidence,
            final String districtSubdivisionOfResidence, final String districtOfResidence, final Country countryOfResidence) {
        super.edit(type, defaultContact);
        edit(new PhysicalAddressData(address, areaCode, areaOfAreaCode, area, parishOfResidence, districtSubdivisionOfResidence,
                districtOfResidence, countryOfResidence));
    }

    @Override
    public boolean isPhysicalAddress() {
        return true;
    }

    public String getCountryOfResidenceName() {
        return getCountryOfResidence() != null ? getCountryOfResidence().getName() : StringUtils.EMPTY;
    }

    @Override
    public void deleteWithoutCheckRules() {
        super.deleteWithoutCheckRules();
        // setCountryOfResidence(null);

    }

    @Override
    public void delete() {
        super.delete();
        // setCountryOfResidence(null);
    }

    @Override
    protected void checkRulesToDelete() {
        if (getParty().getPartyContacts(getClass()).size() == 1) {
            throw new DomainException("error.domain.contacts.PhysicalAddress.cannot.remove.last.physicalAddress");
        }
    }

    public String getPostalCode() {
        final StringBuilder result = new StringBuilder();
        result.append(getAreaCode());
        result.append(" ");
        result.append(getAreaOfAreaCode());
        return result.toString();
    }

    @Override
    public boolean hasValue(String value) {
        return false;
    }

    @Atomic
    @Override
    public void setValid() {
        if (!isValid()) {
            final PhysicalAddressValidation physicalAddressValidation = (PhysicalAddressValidation) getPartyContactValidation();
            physicalAddressValidation.setValid();
            final String userName = AccessControl.getPerson() == null ? "-" : AccessControl.getPerson().getUsername();
            physicalAddressValidation.setDescription(BundleUtil.getString(Bundle.ACADEMIC,
                    "label.contacts.physicalAddress.validation.description", userName));
        }
    }

    @Override
    public void logCreate(Person person) {
        logCreateAux(person, "label.partyContacts.PhysicalAddress");
    }

    @Override
    public void logEdit(Person person, boolean propertiesChanged, boolean valueChanged, boolean createdNewContact, String newValue) {
        logEditAux(person, propertiesChanged, valueChanged, createdNewContact, newValue, "label.partyContacts.PhysicalAddress");
    }

    @Override
    public void logDelete(Person person) {
        logDeleteAux(person, "label.partyContacts.PhysicalAddress");
    }

    @Override
    public void logValid(Person person) {
        logValidAux(person, "label.partyContacts.PhysicalAddress");
    }

    @Override
    public void logRefuse(Person person) {
        logRefuseAux(person, "label.partyContacts.PhysicalAddress");
    }

}
