#include <iostream>
#include <iomanip>
#include <ibpp.h>
int main() {
	try {
	IBPP::Database db = IBPP::DatabaseFactory("localhost","/var/lib/firebird/2.5/data/employee.fdb","SYSDBA","coursework");
	db->Connect();
	IBPP::Transaction tr = IBPP::TransactionFactory(db);
	tr->Start();
	std::string name;
	int customer, items;
	IBPP::Statement st = IBPP::StatementFactory(db, tr);
	//SQL query
	st->Execute("SELECT first_name||' '||last_name as name, cust_no, SUM(qty_ordered)FROM Employee JOIN sales ON emp_no=sales_rep GROUP BY name, cust_no HAVING SUM(qty_ordered) > 10 ORDER BY name ASC");
	// Header 			
	std::cout << std::left << std::setw(25) << "Employee" << std::left << std::setw(10) << "Customer" << std::left << std::setw(10) << "Items" << std::endl;
	std::cout << "----------------------   --------  -----" << std::endl;
	// Row by row output
	while (st->Fetch()) {
		st->Get(1, name);
		st->Get(2, customer);
		st->Get(3, items);
		std::cout << std::left << std::setw(25) << name.c_str() << std::setw(10) << customer << std::setw(10) << items << std::endl;
	}
	tr->Commit();
	db->Disconnect();
	} 
	catch (IBPP::Exception& e) {
		std::cout << e.ErrorMessage();	
	}
	return 0;
}
