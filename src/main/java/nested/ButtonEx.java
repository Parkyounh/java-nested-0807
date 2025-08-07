package nested;

public class ButtonEx {

	public static void main(String[] args) {
		Button btn= new Button();
		
		btn.setOnClickListenner(new CallListener());
		btn.touch();
		
		btn.setOnClickListenner(new MessageListener());
		btn.touch();
	}

}
