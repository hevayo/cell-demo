import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Tracking12",
    id: "Tracking12-11d9a571-b7db-4403-aedc-4d3448079821"
}
service / on new http:Listener(9090) {

    @display {
        label: "mysql",
        id: "mysql-8f42fb2d-fa79-41ac-8cc7-3dbe90e29fd9"
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
