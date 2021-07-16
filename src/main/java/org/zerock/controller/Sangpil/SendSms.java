package org.zerock.controller.Sangpil;

/*import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;*/

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class SendSms {
  /* public static void sendSms(String idP) {
    String api_key = "NCSNBKHRRNHYC31R";
    String api_secret = "UMPSHJVGHAJ9OINOPCK21BIDTKNIVOTV";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", idP);
    params.put("from", "01040836159");
    params.put("type", "SMS");
    params.put("text", "Coolsms HiHi Message!");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
  */
}