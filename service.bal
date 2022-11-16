import ballerina/http;
type Address record {
    string address1;
    string city;
    string postal_code;
    string region;
    string country;
};

type AddressValidationError distinct error;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # Validates a address
    # + address - address to validate
    # + return - HTTP Ok if the address is found, otherwise HTTP Not found
    resource function post maps/address/validate(@http:Payload Address address) returns Address|AddressValidationError {

        if address.address1 == "" {
            return error AddressValidationError("unable to find the address " + address.address1);
        } else {
            return address;
        }
    }
}
