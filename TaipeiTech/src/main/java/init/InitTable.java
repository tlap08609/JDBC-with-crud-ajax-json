package init;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InitTable {

	public static void main(String[] args) {
		Connection con;
		// PreparedStatement pstmt;
		// mysql要更新才可以用innodb
		// ENGINE = INNODB
		Statement stmt;
		String dropString;
		String createString;
		String sql1;
		try {

			// 連上後端的資料庫
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/jdbcpra",
					"root", "student");
			// 建立Statement物件，以便傳送SQL命令到後端的資料庫
			stmt = con.createStatement();

		} catch (SQLException e) {
			System.err.println("存取資料庫有關的例外：" + e.getMessage());
			e.printStackTrace();
			return;
		}

		dropString = "DROP Table emp ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("emp表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除emp表格時發生例外: " + e.getMessage());
		}
		dropString = "DROP Table dept ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("dept表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除dept表格時發生例外: " + e.getMessage());
		}
		dropString = "DROP Table salgrade ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("dept表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除dept表格時發生例外: " + e.getMessage());
		}

		dropString = "DROP Table customer ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("customer表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除customer表格時發生例外: " + e.getMessage());
		}

		dropString = "DROP Table ORD ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("ord表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除ord表格時發生例外: " + e.getMessage());
		}
		dropString = "DROP Table item ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("item表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除item表格時發生例外: " + e.getMessage());
		}
		dropString = "DROP Table PRODUCT ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("product表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除product表格時發生例外: " + e.getMessage());
		}
		dropString = "DROP Table PRICE ";
		try {
			// 執行刪除EMP表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("price表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除price表格時發生例外: " + e.getMessage());
		}
		createString = "Create Table emp "
				+ "(EMPNO           INT NOT NULL, "
				+ " ENAME		VARCHAR(10), "
				+ " JOB                 VARCHAR(10), "
				+ " MGR                 INT, "
				+ " HIREDATE            DATETIME, "
				+ " SAL                 DECIMAL(7,2), "
				+ " COMM                DECIMAL(7,2), "
				+ " DEPTNO              INT NOT NULL, "
				+ " CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO), "
				+ " CONSTRAINT EMP_MGR_FK FOREIGN KEY (MGR) REFERENCES EMP (EMPNO), "
				+ " CONSTRAINT EMP_EMPNO_PK PRIMARY KEY (EMPNO) " + " ) ";

		try {
			stmt.executeUpdate(createString);
			System.out.println("emp表格產生成功");
			sql1 = "INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'19811117',5000,NULL,10),"
					+ "(7698,'BLAKE','MANAGER',7839,'19810501',2850,NULL,30),"
					+ "( 7782,'CLARK','MANAGER',7839,'19810609',2450,NULL,10),"
					+ "(7566,'JONES','MANAGER',7839,'19810402',2975,NULL,20),"
					+ "(7654,'MARTIN','SALESMAN',7698,'19810928',1250,1400,30),"
					+ "(7499,'ALLEN','SALESMAN',7698,'19810220',1600,300,30),"
					+ "(7844,'TURNER','SALESMAN',7698,'19810908',1500,0,30),"
					+ "(7900,'JAMES','CLERK',7698,'19811203',950,NULL,30),"
					+ "(7521,'WARD','SALESMAN',7698,'19810222',1250,500,30),"
					+ "(7902,'FORD','ANALYST',7566,'19811203',3000,NULL,20),"
					+ "(7369,'SMITH','CLERK',7902,'19801217',800,NULL,20),"
					+ "(7788,'SCOTT','ANALYST',7566,'19821209',3000,NULL,20),"
					+ "(7876,'ADAMS','CLERK',7788,'19830112',1100,NULL,20),"
					+ "(7934,'MILLER','CLERK',7782,'19820123',1300,NULL,10);";
			stmt.executeUpdate(sql1);
			System.out.println("emp 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建emp表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		createString = "Create Table dept "
				+ "(DEPTNO             INT NOT NULL, "
				+ " DNAME              VARCHAR(14), "
				+ " LOC                VARCHAR(13), "
				+ " CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO) " + " ) ";
		try {
			stmt.executeUpdate(createString);
			System.out.println("dept表格產生成功");
			sql1 = "INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK'),"
					+ "(20,'RESEARCH','DALLAS')," + "(30,'SALES','CHICAGO'),"
					+ "(40,'OPERATIONS','BOSTON');";
			stmt.executeUpdate(sql1);
			System.out.println("dept 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建dept表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		createString = "Create Table salgrade "
				+ "(GRADE             TINYINT, "
				+ " LOSAL             NUMERIC(7,2), "
				+ " HISAL             NUMERIC(7,2) " + ")";

		try {
			stmt.executeUpdate(createString);
			System.out.println("salgrade表格產生成功");
			sql1 = "INSERT INTO salgrade VALUES (1,700,1200),"
					+ "(2,1201,1400)," + "(3,1401,2000)," + "(4,2001,3000),"
					+ "(5,3001,9999);";
			stmt.executeUpdate(sql1);
			System.out.println("salgrade 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建salgrade表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		createString = "Create Table customer "
				+ "(CUSTID             INT NOT NULL, "
				+ " NAME               VARCHAR (45), "
				+ " ADDRESS            VARCHAR (40), "
				+ " CITY               VARCHAR (30), "
				+ " STATE              VARCHAR (2), "
				+ " ZIP                VARCHAR (9), "
				+ " AREA               NUMERIC (3), "
				+ " PHONE              VARCHAR (9), "
				+ " REPID              INT NOT NULL, "
				+ " CREDITLIMIT   NUMERIC (9,2), "
				+ " CONSTRAINT CUSTOMER_CUSTID_PK PRIMARY KEY (CUSTID), "
				+ " CONSTRAINT CUSTOMER_CUSTID_CK CHECK (CUSTID > 0) " + " ) ";

		try {
			stmt.executeUpdate(createString);
			System.out.println("customer表格產生成功");
			sql1 = "INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT, CITY, AREA, ADDRESS) VALUES ('96711', 'CA', '7844', '598-6609', 'JOCKSPORTS', '100', '5000', 'BELMONT', '415', '345 VIEWRIDGE'),"
					+ "('94061', 'CA', '7521', '368-1223', 'TKB SPORT SHOP', '101', '10000', 'REDWOOD CITY', '415', '490 BOLI RD.'),"
					+ "('95133', 'CA', '7654', '644-3341', 'VOLLYRITE', '102', '7000', 'BURLINGAME', '415', '9722 HAMILTON'),"
					+ "('97544', 'CA', '7521', '677-9312', 'JUST TENNIS', '103', '3000', 'BURLINGAME', '415', 'HILLVIEW MALL'),"
					+ "('93301', 'CA', '7499', '996-2323', 'EVERY MOUNTAIN', '104', '10000', 'CUPERTINO', '408', '574 SUYYYYY RD.'),"
					+ "('91003', 'CA', '7844', '376-9966', 'K + T SPORTS', '105', '5000', 'SANTA CLARA', '408', '3476 EL PASEO'),"
					+ "('94301', 'CA', '7521', '364-9777', 'SHAPE UP', '106', '6000', 'PALO ALTO', '415', '908 SEQUOIA'),"
					+ "('93301', 'CA', '7499', '967-4398', 'WOMENS SPORTS', '107', '10000', 'SUNNYVALE', '408', 'VALCO VILLAGE'),"
					+ "('55649', 'MN', '7844', '566-9123', 'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER', '108', '8000', 'HIBBING', '612', '98 LONE PINE WAY');";
			stmt.executeUpdate(sql1);
			System.out.println("customer 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建customer表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}
		// ;;
		createString = "Create Table ORD "
				+ "(ORDID                INT NOT NULL AUTO_INCREMENT, "
				+ " ORDERDATE            DATETIME, "
				+ " COMMPLAN             CHAR (1), "
				+ " CUSTID               INT NOT NULL, "
				+ " SHIPDATE             DATETIME, "
				+ " TOTAL                NUMERIC (8,2), "
				+ " CONSTRAINT ORD_CUSTID_FK FOREIGN KEY (CUSTID) REFERENCES CUSTOMER (CUSTID), "
				+ " CONSTRAINT ORD_ORDID_PK PRIMARY KEY (ORDID), "
				+ "CONSTRAINT ORD_TOTAL_CK CHECK (TOTAL >= 0) " + " )";
		// AUTO_INCREMENT = 601

		try {
			stmt.executeUpdate(createString);
			System.out.println("ord表格產生成功");
			sql1 = "INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN) VALUES ('101.4','19870108', '19870107','101', 'A'),"
					+ "('45','19870111',  '19870111', '102', 'B'),"
					+ "('5860','19870120',  '19870115', '104', 'C'),"
					+ "('2.4', '19860530',  '19860501', '106', 'A'),"
					+ "('56', '19860620',  '19860605', '102', 'B'),"
					+ "('698', '19860630','19860615', '106', 'A'),"
					+ "('8324','19860730',  '19860714', '106', 'A'),"
					+ "('3.4', '19860730',  '19860714', '100', 'A'),"
					+ "('97.5', '19860815','19860801', '100', 'B'),"
					+ "('5.6', '19860718',  '19860718', '104', 'C'),"
					+ "('35.2', '19860725', '19860725', '104', 'C'),"
					+ "('224','19860605', '19860605', '102', ''),"
					+ "('4450','19870512',  '19870312', '100', ''),"
					+ "('6400', '19870201', '19870201', '108', ''),"
					+ "('23940', '19870205', '19870201', '102', ''),"
					+ "('764', '19870210',  '19870203', '103', ''),"
					+ "('1260','19870204', '19870202', '104', ''),"
					+ "('46370', '19870303', '19870205', '105', ''),"
					+ "('710','19870206', '19870201', '107', ''),"
					+ "('3510.5','19870306', '19870215', '102', 'A'),"
					+ "('730', '19870106', '19870101', '100', 'A');";
			stmt.executeUpdate(sql1);
			System.out.println("ord 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建ord表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		createString = "Create Table item "
				+ "(ORDID               INT NOT NULL, "
				+ " ITEMID              INT NOT NULL, "
				+ " PRODID              INT, "
				+ " ACTUALPRICE         NUMERIC (8,2), "
				+ " QTY                 NUMERIC (8), "
				+ " ITEMTOT             NUMERIC (8,2), "
				+ " CONSTRAINT ITEM_ORDID_FK FOREIGN KEY (ORDID) REFERENCES ORD (ORDID), "
				+ " CONSTRAINT ITEM_ORDID_ITEMID_PK PRIMARY KEY (ORDID,ITEMID) "
				+ " ) ";

		try {
			stmt.executeUpdate(createString);
			System.out.println("item表格產生成功");
			sql1 = "INSERT INTO ITEM (QTY, PRODID, ORDID, ITEMTOT, ITEMID, ACTUALPRICE) VALUES ('1', '100890', '610', '58', '3', '58'),"
					+ "( '1', '100861', '611', '45', '1', '45'),"
					+ "( '100', '100860', '612', '3000', '1', '30'),"
					+ "( '1', '200376', '601', '2.4', '1', '2.4'),"
					+ "( '20', '100870', '602', '56', '1', '2.8'),"
					+ "( '3', '100890', '604', '174', '1', '58'),"
					+ "( '2', '100861', '604', '84', '2', '42'),"
					+ " ( '10', '100860', '604', '440', '3', '44'),"
					+ "( '4', '100860', '603', '224', '2', '56'),"
					+ "( '1', '100860', '610', '35', '1', '35'),"
					+ "( '3', '100870', '610', '8.4', '2', '2.8'),"
					+ "( '200', '200376', '613', '440', '4', '2.2'),"
					+ "( '444', '100860', '614', '15540', '1', '35'),"
					+ "( '1000', '100870', '614', '2800', '2', '2.8'),"
					+ "( '20', '100861', '612', '810', '2', '40.5'),"
					+ "('150', '101863', '612', '1500', '3', '10'),"
					+ "('10', '100860', '620', '350', '1', '35'),"
					+ "('1000', '200376', '620', '2400', '2', '2.4'),"
					+ "('500', '102130', '620', '1700', '3', '3.4'),"
					+ "( '100', '100871', '613', '560', '1', '5.6'),"
					+ "('200', '101860', '613', '4800', '2', '24'),"
					+ "('150', '200380', '613', '600', '3', '4'),"
					+ " ('100', '102130', '619', '340', '3', '3.4'),"
					+ "('50', '100860', '617', '1750', '1', '35'),"
					+ "('100', '100861', '617', '4500', '2', '45'),"
					+ "('10', '100861', '616', '450', '1', '45'),"
					+ "('50', '100870', '616', '140', '2', '2.8'),"
					+ "('2', '100890', '616', '116', '3', '58'),"
					+ "('10', '102130', '616', '34', '4', '3.4'),"
					+ "('10', '200376' , '616', '24', '5', '2.4'),"
					+ "('100', '200380', '619', '400', '1', '4'),"
					+ "('100', '200376', '619', '240', '2', '2.4'),"
					+ "('4', '100861', '615', '180', '1', '45'),"
					+ "('1', '100871', '607', '5.6', '1', '5.6'),"
					+ "('100', '100870', '615', '280', '2', '2.8'),"
					+ "('500', '100870', '617', '1400', '3', '2.8'),"
					+ "('500', '100871', '617', '2800', '4', '5.6'),"
					+ "('500', '100890', '617', '29000', '5', '58'),"
					+ "('100', '101860', '617', '2400', '6', '24'),"
					+ "('200', '101863', '617', '2500', '7', '12.5'),"
					+ "('100', '102130', '617', '340', '8', '3.4'),"
					+ "('200', '200376', '617', '480', '9', '2.4'),"
					+ "('300', '200380', '617', '1200', '10', '4'),"
					+ "('5', '100870', '609', '12.5', '2', '2.5'),"
					+ "('1', '100890', '609', '50', '3', '50'),"
					+ "('23', '100860', '618', '805', '1', '35'),"
					+ "('50', '100861', '618', '2255.5', '2', '45.11'),"
					+ "('10', '100870', '618', '450', '3', '45'),"
					+ "('10', '100861', '621', '450', '1', '45'),"
					+ "('100', '100870', '621', '280', '2', '2.8'),"
					+ "('50', '100871', '615', '250', '3', '5'),"
					+ "('1', '101860', '608', '24', '1', '24'),"
					+ "('2', '100871', '608', '11.2', '2', '5.6'),"
					+ "('1', '100861', '609', '35', '1', '35'),"
					+ "('1', '102130', '606', '3.4', '1', '3.4'),"
					+ "('100', '100861', '605', '4500', '1', '45'),"
					+ "('500', '100870', '605', '1400', '2', '2.8'),"
					+ "('5', '100890', '605', '290', '3', '58'),"
					+ "('50', '101860', '605', '1200', '4', '24'),"
					+ "('100', '101863', '605', '900', '5', '9'),"
					+ "('10', '102130', '605', '34', '6', '3.4'),"
					+ "('100', '100871', '612', '550', '4', '5.5'),"
					+ "('50', '100871', '619', '280', '4', '5.6');";
			stmt.executeUpdate(sql1);
			System.out.println("item 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建item表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		createString = "Create Table product  " + "(PRODID              INT, "
				+ " DESCRIP             VARCHAR (30), "
				+ " CONSTRAINT PRODID_PK PRIMARY KEY(PRODID) " + " ) ";

		try {
			stmt.executeUpdate(createString);
			System.out.println("product表格產生成功");
			sql1 = "INSERT INTO PRODUCT (PRODID, DESCRIP) VALUES ('100860', 'ACE TENNIS RACKET I'),"
					+ "('100861', 'ACE TENNIS RACKET II'),"
					+ "('100870', 'ACE TENNIS BALLS-3 PACK'),"
					+ "('100871', 'ACE TENNIS BALLS-6 PACK'),"
					+ "('100890', 'ACE TENNIS NET'),"
					+ "('101860', 'SP TENNIS RACKET'),"
					+ "('101863', 'SP JUNIOR RACKET'),"
					+ "('102130', 'RH: \"GUIDE TO TENNIS\"'),"
					+ "('200376', 'SB ENERGY BAR-6 PACK'),"
					+ "('200380', 'SB VITA SNACK-6 PACK');";
			stmt.executeUpdate(sql1);
			System.out.println("product 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建product表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		createString = "Create Table price  "
				+ "(PRODID               INT NOT NULL, "
				+ " STDPRICE             NUMERIC (8,2), "
				+ " MINPRICE             NUMERIC (8,2), "
				+ " STARTDATE            DATETIME, "
				+ " ENDDATE              DATETIME " + " ) ";

		try {
			stmt.executeUpdate(createString);
			System.out.println("price表格產生成功");
			sql1 = "INSERT INTO price (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE) VALUES ('4.8', '19850101', '100871', '3.2', '19851231'),"
					+ "('58','19850101', '100890', '46.4', NULL),"
					+ "('54', '19840101', '100890', '40.5', '19840531'),"
					+ "('35','19860601', '100860', '28', NULL),"
					+ "('32','19860101', '100860', '25.6', '19860531'),"
					+ "('30', '19850101', '100860', '24', '19851231'),"
					+ "('45','19860601', '100861', '36', NULL),"
					+ "('42','19860101', '100861', '33.6', '19860531'),"
					+ "('39', '19850101', '100861', '31.2', '19851231'),"
					+ "('2.8','19860101', '100870', '2.4', NULL),"
					+ "('2.4','19850101', '100870', '1.9', '19851201'),"
					+ "('5.6','19860101', '100871', '4.8', NULL),"
					+ "('24', '19850215', '101860', '18', NULL),"
					+ "('12.5','19850215', '101863', '9.4', NULL),"
					+ "('3.4','19850818', '102130', '2.8', NULL),"
					+ "('2.4', '19861115', '200376', '1.75', NULL),"
					+ "('4', '19861115', '200380', '3.2', NULL);";
			stmt.executeUpdate(sql1);
			System.out.println("price 資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建price表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}
		// 關閉相關的物件
		finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				System.err.println("關閉相關物件時發生例外: " + e);
			}
			try {
				if (stmt != null)
					con.close();
			} catch (Exception e) {
				System.err.println("關閉相關物件時發生例外: " + e);
			}
		}

	}
}
