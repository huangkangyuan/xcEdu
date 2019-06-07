package com.xuecheng.test.freemarker;

import java.sql.*;
import java.util.*;

public class ConnectionPool {

    private Vector<Connection> freeConnections = new Vector<>();
    private int minConn = 0; //最小连接数,默认为0
    private int curConn = 0; //已使用的连接数
    private int maxConn = 0; //连接池中最大的连接数
    private String driver;  //数据库驱动类
    private String URL;     //数据库的JDBC URL
    private String user;    //数据库登录用户
    private String password; //数据库用户登录口令

    /**
     * 初始化连接池
     *
     * @param driver   数据库驱动类
     * @param URL      数据库的JDBC URL
     * @param user     数据库登录用户
     * @param password 数据库用户登录口令
     * @param minConn  最小连接数
     * @param maxConn  连接池中最大的连接数
     */
    private ConnectionPool(String driver, String URL, String user, String password, int minConn, int maxConn) {
        this.minConn = minConn;
        this.maxConn = maxConn;
        this.driver = driver;
        this.URL = URL;
        this.user = user;
        this.password = password;
//        initConnection();
    }

    /**
     * 初始化连接池,如未指定最小连接数,默认为0
     */
    public ConnectionPool(String driver, String URL, String user, String password, int maxConn) {
        this(driver, URL, user, password, 0, maxConn);
    }

    private void initConnection() throws ClassNotFoundException {
        Class.forName(driver);
        Connection con = null;
        for (int i = 0; i < minConn; ) {
            try {
                if (user == null) {
                    con = DriverManager.getConnection(URL);
                } else {
                    con = DriverManager.getConnection(URL, user, password);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                con = null;
            }
            if (con == null) {
                continue;
            } else {
                freeConnections.add(con);
                i++;
            }
        }
    }

    /*
     *从连接池获得一个可用连接。
     *如没有空闲的连接且当前连接数小于最大接数限制,则创建新连接。
     *如原来登记为可用的连接不再有效,则从向量删除之,然后递归调用以试新的可用连接
     * 如当前连接数已达到最大连接数则返回空
     */
    private synchronized Connection getConnection(long timeout) {
        Connection con = null;
        if (freeConnections.size() > 0) {
            con = (Connection) freeConnections.firstElement();
            freeConnections.removeElementAt(0);
        }
        try {
            assert con != null;
            if (con.isClosed()) {
                con = getConnection(timeout);
            } else if (curConn < maxConn) {
                con = newConnection();
            } else {
                try {
                    wait(timeout);
                } catch (InterruptedException e) {
                    return null;
                }
            }
        } catch (SQLException e) {
            con = getConnection(timeout);
        }

        if (con != null) {
            curConn++;
        }
        return con;
    }

    /**
     * 创建新的连接
     * @return 返回新的连接
     */
    private Connection newConnection() {
        Connection con = null;
        try {
            if (user == null) {
                con = DriverManager.getConnection(URL);
            } else {
                con = DriverManager.getConnection(URL, user, password);
            }
        } catch (SQLException e) {
            return null;
        }
        return con;
    }

    /**
     * 将不使用的连接返回给连接池
     * @param con 连接
     */
    public synchronized void freeConnection(Connection con){
        freeConnections.addElement(con);
        curConn--;
        notifyAll();
    }

    /**
     * 关闭所有连接
     */
    public synchronized void release(){
        Enumeration allConnections = freeConnections.elements();
        while (allConnections.hasMoreElements()){
            Connection con = (Connection) allConnections.nextElement();
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            freeConnections.removeAllElements();
        }
    }
}
