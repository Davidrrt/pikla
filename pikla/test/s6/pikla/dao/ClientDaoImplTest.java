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
import s6.pikla.model.Client;

/**
 *
 * @author davra
 */
public class ClientDaoImplTest {
    
    public ClientDaoImplTest() {
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
     * Test of save method, of class ClientDaoImpl.
     */
    @Test
    public void testSave() throws Exception {
        System.out.println("save");
        Client person = null;
        ClientDaoImpl instance = null;
        instance.save(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class ClientDaoImpl.
     */
    @Test
    public void testUpdate() throws Exception {
        System.out.println("update");
        Client person = null;
        ClientDaoImpl instance = null;
        instance.update(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class ClientDaoImpl.
     */
    @Test
    public void testDelete() throws Exception {
        System.out.println("delete");
        Client person = null;
        ClientDaoImpl instance = null;
        instance.delete(person);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findAll method, of class ClientDaoImpl.
     */
    @Test
    public void testFindAll() throws Exception {
        System.out.println("findAll");
        ClientDaoImpl instance = null;
        List<Client> expResult = null;
        List<Client> result = instance.findAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findByid method, of class ClientDaoImpl.
     */
    @Test
    public void testFindByid() throws Exception {
        System.out.println("findByid");
        int id = 0;
        ClientDaoImpl instance = null;
        Client expResult = null;
        Client result = instance.findByid(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
