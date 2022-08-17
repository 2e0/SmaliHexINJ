# Modules, Librairies, et API/SDK etc..
system("clear"); # Exécution de clear dans le terminal


use Crypt::Digest::CHAES ':all';
sleep(1);
print("                    Welcome to OBF-SM4LI\n");
sleep(3);
print("------------------------------------------------------");
print("\n");
print("   Session Date  :  ");
system("date");
print("------------------------------------------------------");

print("\n");

sleep(4);


print "Input your .smali file : ";
my $file = <STDIN>;
chomp($file);

print "Do you want to zip it ? (y/n) : ";
$yesorno = <>;

system("clear");



open (my $fh, '<', $file) or die "Can't Open $file $!\n";

my $file_content = do { local $/; <$fh> };

use String::HexConvert ':all';
 
$obfuscated = ascii_to_hex($file_content);


my $file = "obfuscated.smali";

# Use the open() function to create the file.
unless(open FILE, '>'.$file) {
    # Die with error message 
    # if we can't open it.
    die "\nUnable to create $file\n";
}

# Encodage + Payload (d'obfuscation) Java Retranscrit en Smali

print FILE "x";
print FILE "$obfuscated\n";

# Fermeture du fichier.
close FILE;

system("zip $file");



print("Done.\n");











































