package reserve;

import java.io.*;



public class SendSMS

{

    public SendSMS( String nickname )

    {

        SMS sms = new SMS();

        

        sms.appversion("TEST/1.0");

        sms.charset("utf8");

        sms.setuser("npnorladb", "rladbwls1");				// coolsms 계정 입력해주시면되요



        String number[] = new String[2];                                  // 받을 사람 폰번호

        number[0] = "01031299038";
		



        

        for( int i = 0 ; i < number.length ; i ++ ) {

	        SmsMessagePdu pdu = new SmsMessagePdu();

	        pdu.type = "SMS";

	        pdu.destinationAddress = number[i];

	        pdu.scAddress = "01031299038"	;                   // 발신자 번호          

	        pdu.text = "문자 발송 테스트";					    // 보낼 메세지 내용

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