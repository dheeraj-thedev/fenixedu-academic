package net.sourceforge.fenixedu.domain.phd.thesis;

import java.util.Collections;
import java.util.Comparator;

import net.sourceforge.fenixedu.domain.RootDomainObject;

import org.joda.time.DateTime;

abstract public class ThesisJuryElement extends ThesisJuryElement_Base {

    static public final Comparator<ThesisJuryElement> COMPARATOR_BY_ELEMENT_ORDER = new Comparator<ThesisJuryElement>() {
	@Override
	public int compare(ThesisJuryElement o1, ThesisJuryElement o2) {
	    return o1.getElementOrder().compareTo(o2.getElementOrder());
	}
    };

    protected ThesisJuryElement() {
	super();
	setRootDomainObject(RootDomainObject.getInstance());
	setCreationDate(new DateTime());
    }

    protected void init(final PhdThesisProcess process) {
	check(process, "error.ThesisJuryElement.invalid.process");
	setElementOrder(generateNextElementOrder(process));
	setProcess(process);
    }

    private Integer generateNextElementOrder(final PhdThesisProcess process) {
	if (!process.hasAnyThesisJuryElements()) {
	    return Integer.valueOf(1);
	}
	return Integer.valueOf(Collections.max(process.getThesisJuryElements(), ThesisJuryElement.COMPARATOR_BY_ELEMENT_ORDER)
		.getElementOrder().intValue() + 1);
    }

    public void delete() {
	disconnect();
	deleteDomainObject();
    }

    protected void disconnect() {
	removeProcess();
	removeRootDomainObject();
    }

    abstract public String getName();

    abstract public String getQualification();

    abstract public String getCategory();

    abstract public String getInstitution(); // Unit or String?

    abstract public String getAddress();

    abstract public String getPhone();

    abstract public String getEmail();

    static public ThesisJuryElement create(final PhdThesisProcess process, final PhdThesisJuryElementBean bean) {
	if (bean.isInternal()) {
	    return new InternalThesisJuryElement(process, bean);
	} else {
	    return new ExternalThesisJuryElement(process, bean);
	}
    }

}
