/*
 * Created on 20/Nov/2003
 * 
 */
package Dominio.grant.contract;

import java.util.Date;

import Dominio.IDomainObject;
import Dominio.ITeacher;

/**
 * @author Barbosa
 * @author Pica
 *  
 */
public interface IGrantOrientationTeacher extends IDomainObject {

    public Date getBeginDate();

    public Date getEndDate();

    public ITeacher getOrientationTeacher();

    public IGrantContract getGrantContract();

    public void setBeginDate(Date beginDate);

    public void setEndDate(Date endDate);

    public void setGrantContract(IGrantContract grantContract);

    public void setOrientationTeacher(ITeacher OrientationTeacher);
}