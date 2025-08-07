package nested;

public class Button {

	OnClickListener listener;
	
	void setOnClickListenner(OnClickListener listener) {
		this.listener = listener;
	}
	
	void touch() {
		listener.onClick();
	}
	interface OnClickListener{
		void onClick();
	}

}
