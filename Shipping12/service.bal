import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Shipping12",
    id: "Shipping12-ac692f41-9dab-4ed0-856d-f0ebeac6b04e"
}
service / on new http:Listener(9090) {

    @display {
        label: "Tracking12",
        id: "Tracking12-11d9a571-b7db-4403-aedc-4d3448079821"
    }
    http:Client tracking12Client;

    function init() returns error? {
        self.tracking12Client = check new ("");
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
