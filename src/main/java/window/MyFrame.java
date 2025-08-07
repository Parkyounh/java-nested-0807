package window;

import java.awt.Container;import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;

class MyAction implements ActionListener{
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		System.out.println();
	}
	
}

public class MyFrame extends JFrame{
	JButton btn = new JButton("클릭");
	JButton btn2 = new JButton("클릭");
	JTextField tf = new JTextField();
	JTextField tf2 = new JTextField();
	
	MyFrame(){
		Container con = this.getContentPane();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		con.setLayout(null);
		
		con.add(btn);
		btn.setBounds(10, 20, 70, 40);
		
		con.add(btn2);
		btn2.setBounds(10, 80, 70, 40);
		
		con.add(tf);
		tf.setBounds(100, 20, 70, 40);;
	
		
		this.setLocation(1000, 400);
		this.setSize(300, 200);
		this.setVisible(true);
		
//		btn.addActionListener((e) ->{
//			System.out.println("나온다");
//		});
		
		btn.addActionListener(new MyAction());
		
		
	}
	class MyAction implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			System.out.println(tf.getText());
		}
		
	}

	
	public static void main(String[] args) {
		new MyFrame();
	}
}
