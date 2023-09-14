package api.utility.data;

import java.util.Random;

public class NameGenerator {
    	
          private static final String[] FIRST_NAMES = {
     
              "Mohammad", "Tony", "Haris", "Karim", "Sofia", "Azan", "John", 
               "Suber", "Ramin", "karim"};
    
    
    
        private static final String[] LAST_NAMES = {
        		
                   "Mir", "wahid", "zaman", "Arif", "Naimat", 
                   "Omaid", "jahan", "Mehraban", "Zulfan", "Kabuljan"};
        
        
        private static final Random random = new Random();
        public static String generateFirstName() {
                    int index = random.nextInt(FIRST_NAMES.length);
                    return FIRST_NAMES[index];

                   }

	 

        public static String generateLastName() {
                    int index = random.nextInt(LAST_NAMES.length);
                    return LAST_NAMES[index];

	                }

	 
       public static void main(String[] args) {
	               String firstName = generateFirstName();
	               String lastName = generateLastName();
	   System.out.println("Generated Name: " + firstName + " " + lastName);

	 }

	

}
