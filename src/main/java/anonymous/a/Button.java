package anonymous.a;

public class Button {

	OnClickListener listener;
	
	void setOnClickListenner(OnClickListener listener) {
		this.listener = listener;
	}
	
	void touch() {
		listener.onClick();
	}
	interface OnClickListener{  //static이 왜 필요?
		void onClick();
	}

}
