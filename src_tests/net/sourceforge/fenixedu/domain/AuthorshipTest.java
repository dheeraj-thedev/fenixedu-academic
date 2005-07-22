package net.sourceforge.fenixedu.domain;

import java.util.ArrayList;
import java.util.List;

import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.publication.Authorship;
import net.sourceforge.fenixedu.domain.publication.IAuthorship;
import net.sourceforge.fenixedu.domain.publication.IPublication;
import net.sourceforge.fenixedu.domain.publication.Publication;

public class AuthorshipTest extends DomainTestBase {

    IPerson person1;
    IPerson person2;
    
    List<IPerson> authors;
    
    IPublication publication;
    
    IAuthorship authorship1;
    
    Integer order;
    
    
    protected void setUp() throws Exception {
        super.setUp();
        
        person1 = new Person();
        person1.setNome("Autor1");
        
        person2 = new Person();
        person2.setNome("Autor2");
        
        authors = new ArrayList<IPerson>();
        authors.add(person1);
        
        publication = new Publication();
        
        authorship1 = new Authorship();
        authorship1.setAuthor(person1);
        authorship1.setPublication(publication);
        authorship1.setOrder(1);
        
    }

    public void testCreateAuthorship() {
    	try {
	        IAuthorship authorship = new Authorship(publication, person2, 2);
	        
	        assertEquals("Publication Expected", authorship.getPublication(), publication);
	        assertEquals("Person Expected", authorship.getAuthor(), person2);
	        assertEquals("Authorship's Order Unexpected", new Integer(2), authorship.getOrder());
	        
	        assertEquals("Authorships size unexpected", 2, publication.getPublicationAuthorshipsCount());
	        assertEquals("Teachers size unexpected", 0, publication.getPublicationTeachersCount());
    	} catch (DomainException domainException) {
    		fail("The authorship should have been sucessfully created");
    	}
    }
    
    public void testCreateAuthorshipWithExistingOrder() {
    	try {
    		IAuthorship authorship = new Authorship(publication, person2, 1);
    		fail("The authorship shouldn't have been sucessfully deleted");
    	} catch (DomainException domainException) {
    		//Caso em que se tenta criar uma autoria para uma determinada publica��o/pessoa com uma ordem j� existente
    	}
    	
    }

    public void testDeleteAuthorship() {
        
        assertEquals("Unexpected Authorships Size", publication.getPublicationAuthorshipsCount(), 1);
        assertTrue("Publication doen't contain the authorship being deleted", publication.getPublicationAuthorships().contains(authorship1));
        
        authorship1.delete();
        
        assertEquals("Authorships Size Unexpected", 0, publication.getPublicationAuthorshipsCount());
        assertEquals("PublicationTeachers Size Unexpected", 0, publication.getPublicationTeachersCount());
        assertEquals("Unexpected Authorships Size", person1.getPersonAuthorshipsCount(), 0);
        assertEquals("Unexpected Authorships Size", person2.getPersonAuthorshipsCount(), 0);
        
        assertEquals("Unexpected Authorships Size", publication.getPublicationAuthorshipsCount(), 0);
        
        assertFalse("Publication still contains the authorship", publication.getPublicationAuthorships().contains(authorship1));
        
    }

}
