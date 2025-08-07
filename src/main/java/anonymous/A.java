package anonymous;

class Parent{
	void method1() {
		
	}
}

public class A {
	
	Parent field = new Parent() {
//		익명 객체 생성
		int childField;
		void childMethod() {
			System.out.println(childField);
		}
		@Override
		void method1() {
			childField = 10;
		}
		
	};
	
	void method() {
		field.method1();
		Parent field3 = new Parent() {};
		method2(new Parent() {});
	}
	void method2(Parent parent) {}
}
