package event;

import java.io.*;



public class SendSMS

{

    public SendSMS( String nickname )

    {

        SMS sms = new SMS();

        

        sms.appversion("TEST/1.0");

        sms.charset("utf8");

        sms.setuser("tkaqkeldk", "tmxks531!");				// coolsms 계정 입력해주시면되요



        String number[] = new String[2];                                  // 받을 사람 폰번호

        number[0] = "01071842976";

        number[1] = "01071842976";		



        

        for( int i = 0 ; i < number.length ; i ++ ) {

	        SmsMessagePdu pdu = new SmsMessagePdu();

	        pdu.type = "SMS";

	        pdu.destinationAddress = number[i];

	        pdu.scAddress = "01071842976"	;                   // 발신자 번호          

	        pdu.text = "현기에영히힣~";					    // 보낼 메세지 내용

	        sms.add(pdu);

	

	        try {

	            sms.connect();

	            sms.send();

	            sms.disconnect();

	        } catch (IOException e) {

	            System.out.println(e.toString());

	        }

	        sms.printr();

	        sms.emptyall();

	    }

    }

}

 