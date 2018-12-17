
package cn.yxd.service;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "test1Service", targetNamespace = "http://test.yxd.cn/", wsdlLocation = "http://192.168.1.107:8080/hello?wsdl")
public class Test1Service
    extends Service
{

    private final static URL TEST1SERVICE_WSDL_LOCATION;
    private final static WebServiceException TEST1SERVICE_EXCEPTION;
    private final static QName TEST1SERVICE_QNAME = new QName("http://test.yxd.cn/", "test1Service");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://192.168.1.107:8080/hello?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        TEST1SERVICE_WSDL_LOCATION = url;
        TEST1SERVICE_EXCEPTION = e;
    }

    public Test1Service() {
        super(__getWsdlLocation(), TEST1SERVICE_QNAME);
    }

    public Test1Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), TEST1SERVICE_QNAME, features);
    }

    public Test1Service(URL wsdlLocation) {
        super(wsdlLocation, TEST1SERVICE_QNAME);
    }

    public Test1Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, TEST1SERVICE_QNAME, features);
    }

    public Test1Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public Test1Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns Test1
     */
    @WebEndpoint(name = "test1Port")
    public Test1 getTest1Port() {
        return super.getPort(new QName("http://test.yxd.cn/", "test1Port"), Test1.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns Test1
     */
    @WebEndpoint(name = "test1Port")
    public Test1 getTest1Port(WebServiceFeature... features) {
        return super.getPort(new QName("http://test.yxd.cn/", "test1Port"), Test1.class, features);
    }

    private static URL __getWsdlLocation() {
        if (TEST1SERVICE_EXCEPTION!= null) {
            throw TEST1SERVICE_EXCEPTION;
        }
        return TEST1SERVICE_WSDL_LOCATION;
    }

}
