package anonymous;

public class AnonymousExample {

	public static void main(String[] args) {
		Anonymous anony = new Anonymous();
		
		//1번 익명의 객체 필드 사용
		anony.field.turnOn();
		//2번 익명 객체 로컬 변수 사용
		anony.method1();
		//3번 익명 객체 매개값 사용
		anony.method2(new RemoteControl() {
			
			@Override
			public void turnOn() {
				System.out.println("Smart TV를 켭니다.");
				
			}
			
			@Override
			public void turnOff() {
				System.out.println("Smart TV를 끕니다.");
				
			}
		});

	}

}
