
package s6.pikla.dao;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import s6.pikla.model.Voiture;


public class VoitureDaoImplTest {
    
    public VoitureDaoImplTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of save method, of class VoitureDaoImpl.
     */
    @Test
    public void testSave() throws Exception {
        System.out.println("save");
        Voiture person = null;
        VoitureDaoImpl instance = null;
        instance.save(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class VoitureDaoImpl.
     */
    @Test
    public void testUpdate() throws Exception {
        System.out.println("update");
        Voiture person = null;
        VoitureDaoImpl instance = null;
        instance.update(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class VoitureDaoImpl.
     */
    @Test
    public void testDelete() throws Exception {
        System.out.println("delete");
        Voiture person = null;
        VoitureDaoImpl instance = null;
        instance.delete(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findAll method, of class VoitureDaoImpl.
     */
    @Test
    public void testFindAll() throws Exception {
        System.out.println("findAll");
        VoitureDaoImpl instance = null;
        List<Voiture> expResult = null;
        List<Voiture> result = instance.findAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findByid method, of class VoitureDaoImpl.
     */
    @Test
    public void testFindByid() throws Exception {
        System.out.println("findByid");
        int id = 0;
        VoitureDaoImpl instance = null;
        Voiture expResult = null;
        Voiture result = instance.findByid(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
