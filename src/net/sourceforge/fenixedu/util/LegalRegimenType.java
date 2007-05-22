/*
 * Created on Dec 5, 2005
 *	by mrsp
 */
package net.sourceforge.fenixedu.util;

public enum LegalRegimenType {

    //Legal Regimens
    PROVISIONS_ADMINISTRATIVE_CONTRACT,
    PROVISIONS_ADMINISTRATIVE_CONTRACT_SUSPENDED,
    TERM_CONTRACT,
    TEMPORARY_SUBSTITUTION,
    PROVISORY_NOMINATION,
    DEFINITIVE_NOMINATION,
    REFUSED_DEFINITIVE_NOMINATION,
    COMMISSION_OVERTIME_NOMINATION,
    
    //Functions Accumulation    
    FUNCTIONS_ACCUMULATION_WITH_LEADING_POSITIONS,
    
    //End Situations
    TERM_WORK_CONTRACT_END,
    CERTAIN_FORWARD_CONTRACT_END, 
    CERTAIN_FORWARD_CONTRACT_END_PROPER_PRESCRIPTIONS,
    CERTAIN_FORWARD_CONTRACT_RESCISSION_PROPER_PRESCRIPTIONS,
    CERTAIN_FORWARD_CONTRACT_RESCISSION,        
    RETIREMENT,
    RETIREMENT_IN_PROGRESS,                   
    DEATH,
    CONTRACT_END,
    TEMPORARY_SUBSTITUTION_CONTRACT_END,
    DENUNCIATION,
    RESIGNATION,
    RESCISSION,
    IST_OUT_NOMINATION,
    SERVICE_TURN_OFF,
    EXONERATION,
    TRANSFERENCE,
    EMERITUS;
        
    public String getName() {
        return name();
    } 
}
