import ballerina/http;
import ballerina/time;
import ballerina/runtime;

import wso2/gateway;


    
http:Client BalanceInquiry__1_0_0_prod = new (
gateway:retrieveConfig("api_e5a2b33f072de0e82b1035c5f4f4781569d7d8f6262b06063338f25929062cf8_prod_endpoint_0","https://maven-practice.herokuapp.com"),
{ 
httpVersion: gateway:getClientsHttpVersion()
, responseLimits : {
         maxStatusLineLength : gateway:getConfigIntValue(gateway:HTTP_CLIENTS_RESPONSE_LIMITS_CONFIG_INSTANCE_ID,
                    gateway:HTTP_CLIENTS_RESPONSE_MAX_STATUS_LINE_LENGTH, gateway:DEFAULT_HTTP_CLIENTS_RESPONSE_MAX_STATUS_LINE_LENGTH),
         maxHeaderSize : gateway:getConfigIntValue(gateway:HTTP_CLIENTS_RESPONSE_LIMITS_CONFIG_INSTANCE_ID,
                    gateway:HTTP_CLIENTS_RESPONSE_MAX_HEADER_SIZE, gateway:DEFAULT_HTTP_CLIENTS_RESPONSE_MAX_HEADER_SIZE),
         maxEntityBodySize: gateway:getConfigIntValue(gateway:HTTP_CLIENTS_RESPONSE_LIMITS_CONFIG_INSTANCE_ID,
                    gateway:HTTP_CLIENTS_RESPONSE_MAX_ENTITY_BODY_SIZE, gateway:DEFAULT_HTTP_CLIENTS_RESPONSE_MAX_ENTITY_BODY_SIZE)
  }
,
    cache: { enabled: false }


,
secureSocket: gateway:getClientSecureSocket()

,
    poolConfig: gateway:getClientPoolConfig(true, 0, -1, -1, -1)


, http1Settings : {
    proxy: gateway:getClientProxyConfig()
}


});



    
http:Client BalanceInquiry__1_0_0_sand = new (
gateway:retrieveConfig("api_e5a2b33f072de0e82b1035c5f4f4781569d7d8f6262b06063338f25929062cf8_sand_endpoint_0","https://maven-practice.herokuapp.com"),
{ 
httpVersion: gateway:getClientsHttpVersion()
, responseLimits : {
         maxStatusLineLength : gateway:getConfigIntValue(gateway:HTTP_CLIENTS_RESPONSE_LIMITS_CONFIG_INSTANCE_ID,
                    gateway:HTTP_CLIENTS_RESPONSE_MAX_STATUS_LINE_LENGTH, gateway:DEFAULT_HTTP_CLIENTS_RESPONSE_MAX_STATUS_LINE_LENGTH),
         maxHeaderSize : gateway:getConfigIntValue(gateway:HTTP_CLIENTS_RESPONSE_LIMITS_CONFIG_INSTANCE_ID,
                    gateway:HTTP_CLIENTS_RESPONSE_MAX_HEADER_SIZE, gateway:DEFAULT_HTTP_CLIENTS_RESPONSE_MAX_HEADER_SIZE),
         maxEntityBodySize: gateway:getConfigIntValue(gateway:HTTP_CLIENTS_RESPONSE_LIMITS_CONFIG_INSTANCE_ID,
                    gateway:HTTP_CLIENTS_RESPONSE_MAX_ENTITY_BODY_SIZE, gateway:DEFAULT_HTTP_CLIENTS_RESPONSE_MAX_ENTITY_BODY_SIZE)
  }
,
    cache: { enabled: false }


,
secureSocket: gateway:getClientSecureSocket()

,
    poolConfig: gateway:getClientPoolConfig(true, 0, -1, -1, -1)


, http1Settings : {
    proxy: gateway:getClientProxyConfig()
}


});








    
    
    
    
    
    

    
    

    
    



//This variable is added for logging purposes
string BalanceInquiry__1_0_0Key = "BalanceInquiry-1.0.0";









@http:ServiceConfig {
    basePath: "/balances/1.0.0",
    auth: {
        authHandlers: gateway:getAuthHandlers(["oauth2","jwt"], false, false)
    }
   ,
    cors: {
         allowOrigins: ["*"],
         allowCredentials: true,
         allowHeaders: ["authorization","Access-Control-Allow-Origin","Content-Type","SOAPAction","apikey","testKey"],
         allowMethods: ["GET","PUT","POST","DELETE","PATCH","OPTIONS"],
         exposeHeaders: []
    }
    
}

@gateway:API {
    publisher:"",
    name:"BalanceInquiry",
    apiVersion: "1.0.0",
    apiTier : "" ,
    authorizationHeader : "Authorization" ,
    authProviders: ["oauth2","jwt"],
    security: {
            "apikey":[],
            "mutualSSL": "",
            "applicationSecurityOptional": false
        }
}
service BalanceInquiry__1_0_0 on apiListener,
apiSecureListener {


    @http:ResourceConfig {
        methods:["POST"],
        path:"/api/balance/services",
        auth:{
        
            
        
            authHandlers: gateway:getAuthHandlers(["oauth2","jwt","basic"], false, false)
        }
    }
    @gateway:Resource {
        authProviders: ["oauth2","jwt","basic"],
        security: {
            "apikey":[],
            "applicationSecurityOptional": false 
            }
    }
    @gateway:RateLimit{policy : "Unlimited"}
    resource function posta7dca8faf55747ff9e8ec92d5c2ff5bd (http:Caller outboundEp, http:Request req
) {
        handleExpectHeaderForBalanceInquiry__1_0_0(outboundEp, req);
        runtime:InvocationContext invocationContext = runtime:getInvocationContext();

        map<string> pathParams = { 
        };
        invocationContext.attributes["pathParams"] = pathParams;
        

        
        string urlPostfix = gateway:replaceFirst(req.rawPath,"/balances/1.0.0","");
        
        if(urlPostfix != "" && !gateway:hasPrefix(urlPostfix, "/")) {
            urlPostfix = "/" + urlPostfix;
        }
        http:Response|error clientResponse;
        http:Response r = new;
        clientResponse = r;
        string destination_attribute;
        invocationContext.attributes["timeStampRequestOut"] = time:currentTime().time;
        boolean reinitRequired = false;
        string failedEtcdKey = "";
        string failedEtcdKeyConfigValue = "";
        boolean|error hasUrlChanged;
        http:ClientConfiguration newConfig;
        boolean reinitFailed = false;
        boolean isProdEtcdEnabled = false;
        boolean isSandEtcdEnabled = false;
        map<string> endpointEtcdConfigValues = {};
        
            
                if("PRODUCTION" == <string>invocationContext.attributes["KEY_TYPE"]) {
                
                    
    clientResponse = BalanceInquiry__1_0_0_prod->forward(urlPostfix, <@untainted>req);

invocationContext.attributes["destination"] = gateway:retrieveConfig("api_e5a2b33f072de0e82b1035c5f4f4781569d7d8f6262b06063338f25929062cf8_prod_endpoint_0","https://maven-practice.herokuapp.com");


                
                } else {
                
                    
    clientResponse = BalanceInquiry__1_0_0_sand->forward(urlPostfix, <@untainted>req);

invocationContext.attributes["destination"] = gateway:retrieveConfig("api_e5a2b33f072de0e82b1035c5f4f4781569d7d8f6262b06063338f25929062cf8_sand_endpoint_0","https://maven-practice.herokuapp.com");


                
                }
            
            
        
        
        invocationContext.attributes["timeStampResponseIn"] = time:currentTime().time;


        if(clientResponse is http:Response) {
            

            invocationContext.attributes[gateway:DID_EP_RESPOND] = true;
            var outboundResult = outboundEp->respond(clientResponse);
            if (outboundResult is error) {
                gateway:printError(BalanceInquiry__1_0_0Key, "Error when sending response", outboundResult);
            }
        } else {
            http:Response res = new;
            res.statusCode = 500;
            string errorMessage = clientResponse.reason();
            int errorCode = 101503;
            string errorDescription = "Error connecting to the back end";

            if(gateway:contains(errorMessage, "connection timed out") || gateway:contains(errorMessage,"Idle timeout triggered")) {
                errorCode = 101504;
                errorDescription = "Connection timed out";
            }
            if(gateway:contains(errorMessage, "Malformed URL")) {
                errorCode = 101505;
                errorDescription = "Malformed URL";
            }
            invocationContext.attributes["error_response_code"] = errorCode;
            invocationContext.attributes["error_response"] = errorDescription;
            if (! invocationContext.attributes.hasKey(gateway:IS_GRPC)) {
                json payload = {fault : {
                                code : errorCode,
                                message : "Runtime Error",
                                description : errorDescription
                            }};

                            res.setPayload(payload);
            } else {
                gateway:attachGrpcErrorHeaders (res, errorDescription);
            }
            gateway:printError(BalanceInquiry__1_0_0Key, "Error in client response", clientResponse);
            var outboundResult = outboundEp->respond(res);
            if (outboundResult is error) {
                gateway:printError(BalanceInquiry__1_0_0Key, "Error when sending response", outboundResult);
            }
        }
    }

}

    function handleExpectHeaderForBalanceInquiry__1_0_0 (http:Caller outboundEp, http:Request req ) {
        if (req.expects100Continue()) {
            req.removeHeader("Expect");
            var result = outboundEp->continue();
            if (result is error) {
            gateway:printError(BalanceInquiry__1_0_0Key, "Error while sending 100 continue response", result);
            }
        }
    }

function getUrlOfEtcdKeyForReInitBalanceInquiry__1_0_0(string defaultUrlRef,string etcdRef, string defaultUrl, string etcdKey) returns string {
    string retrievedEtcdKey = <string> gateway:retrieveConfig(etcdRef,etcdKey);
    map<any> urlChangedMap = gateway:getUrlChangedMap();
    urlChangedMap[<string> retrievedEtcdKey] = false;
    map<string> etcdUrls = gateway:getEtcdUrlsMap();
    string url = <string> etcdUrls[retrievedEtcdKey];
    if (url == "") {
        return <string> gateway:retrieveConfig(defaultUrlRef, defaultUrl);
    } else {
        return url;
    }
}

function respondFromJavaInterceptorBalanceInquiry__1_0_0(runtime:InvocationContext invocationContext, http:Caller outboundEp) returns boolean {
    boolean tryRespond = false;
    if(invocationContext.attributes.hasKey(gateway:RESPOND_DONE) && invocationContext.attributes.hasKey(gateway:RESPONSE_OBJECT)) {
        if(<boolean>invocationContext.attributes[gateway:RESPOND_DONE]) {
            http:Response clientResponse = <http:Response>invocationContext.attributes[gateway:RESPONSE_OBJECT];
            var outboundResult = outboundEp->respond(clientResponse);
            if (outboundResult is error) {
                gateway:printError(BalanceInquiry__1_0_0Key, "Error when sending response from the interceptor", outboundResult);
            }
            tryRespond = true;
        }
    }
    return tryRespond;
}

function initInterceptorIndexesBalanceInquiry__1_0_0() {


    
        

        
        


}