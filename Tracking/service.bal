import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Tracking",
    id: "Tracking-6325fcfd-2549-488a-9684-3c180e191aa9"
}
service / on new http:Listener(9090) {

    @display {
        label: "mysql",
        id: "ShippingDB"
    }
    mysql:Client mysqlEp;

    function init() returns error? {
        self.mysqlEp = check new ();
    }

    # A resource for generating greetings 
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
