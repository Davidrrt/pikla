/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package s6.pikla.dao;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import s6.pikla.model.Manager;

/**
 *
 * @author davra
 */
public class ManagerDaoImplTest {
    
    public ManagerDaoImplTest() {
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
     * Test of save method, of class ManagerDaoImpl.
     */
    @Test
    public void testSave() throws Exception {
        System.out.println("save");
        Manager person = null;
        ManagerDaoImpl instance = null;
        instance.save(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class ManagerDaoImpl.
     */
    @Test
    public void testUpdate() throws Exception {
        System.out.println("update");
        Manager person = null;
        ManagerDaoImpl instance = null;
        instance.update(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class ManagerDaoImpl.
     */
    @Test
    public void testDelete() throws Exception {
        System.out.println("delete");
        Manager person = null;
        ManagerDaoImpl instance = null;
        instance.delete(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findAll method, of class ManagerDaoImpl.
     */
    @Test
    public void testFindAll() throws Exception {
        System.out.println("findAll");
        ManagerDaoImpl instance = null;
        List<Manager> expResult = null;
        List<Manager> result = instance.findAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findByid method, of class ManagerDaoImpl.
     */
    @Test
    public void testFindByid() throws Exception {
        System.out.println("findByid");
        int id = 0;
        ManagerDaoImpl instance = null;
        Manager expResult = null;
        Manager result = instance.findByid(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
