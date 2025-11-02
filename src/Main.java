public class Main {
	// Simple Java app: prints a greeting and echoes additional arguments.
	public static void main(String[] args) {
		String name = args.length > 0 ? args[0] : "World";
		System.out.println("Hello, " + name + "!");
		if (args.length > 1) {
			System.out.println("Additional args:");
			for (int i = 1; i < args.length; i++) {
				System.out.println(" - " + args[i]);
			}
		}
	}
}
