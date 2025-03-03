# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create a librarian user
User.find_or_create_by!(email: "librarian@example.com") do |user|
  user.name = "Librarian"
  user.surname = "Librarian"
  user.password = "password"
  user.password_confirmation = "password"
  user.role = "library_personnel"
end

# Create books with descriptions
books = [
  { title: "Dashuria e Pashkruar", author: "Ismail Kadare", language: "Albanian", publish_year: 1925, category: "Fiction", description: "Një roman që tregon historinë e dashurisë së pamundur." },
  { title: "Krenaria e Shqipërisë", author: "Dritëro Agolli", language: "Albanian", publish_year: 1813, category: "Romance", description: "Një roman që ndjek zhvillimin emocional të protagonistit." },
  { title: "Rruga e Qytetarit", author: "Bardhyl Londo", language: "Albanian", publish_year: 1951, category: "Bildungsroman", description: "Një histori për rebelimin dhe ankthin e rinisë." },
  { title: "Një Botë e Re", author: "Fatos Kongoli", language: "Albanian", publish_year: 1949, category: "Science_Fiction", description: "Një roman distopik që paraqet një shoqëri totalitare." },
  { title: "Udhëtimi i Bilbili", author: "J.R.R. Tolkien", language: "Albanian", publish_year: 1937, category: "Fantasy", description: "Një roman fantastik për aventurat e një hobiti." },
  { title: "Kodi i Da Vinçit", author: "Dan Brown", language: "Albanian", publish_year: 2003, category: "Mystery", description: "Një roman misteri që ndjek një simbolet dhe një kriptolog." },
  { title: "Yjet e Mëdha", author: "John Green", language: "Albanian", publish_year: 2012, category: "Romance", description: "Një roman për historinë e dashurisë mes dy të rinjve me kancer." },
  { title: "Të bëhesh", author: "Michelle Obama", language: "Albanian", publish_year: 2018, category: "Biographical", description: "Një memoir nga ish-Zonja e Parë e Shteteve të Bashkuara." },
  { title: "Sapiens: Një Histori e Shkurtër e Njerëzimit", author: "Yuval Noah Harari", language: "Albanian", publish_year: 2011, category: "Historical", description: "Një libër që eksploron historinë dhe ndikimin e Homo sapiens." },
  { title: "Alkimisti", author: "Paulo Coelho", language: "Albanian", publish_year: 1988, category: "Fiction", description: "Një roman për një bari andaluzian dhe udhëtimin e tij për në piramidat e Egjiptit." }
]

books.each do |book|
  Book.find_or_create_by!(book)
end

# Create journals with descriptions
journals = [
  { title: "Gazeta Shqiptare", volume: 1, issue: 1, language: "Albanian", publish_year: 1991, category: "Academic", description: "Një gazetë shqiptare me ndikim dhe lexueshmëri në Shqipëri." },
  { title: "Koha Jonë", volume: 1, issue: 1, language: "Albanian", publish_year: 1997, category: "Historic", description: "Një gazetë shqiptare e njohur për gazetarinë e saj investiguese." },
  { title: "Shekulli", volume: 1, issue: 1, language: "Albanian", publish_year: 1999, category: "Popular", description: "Një gazetë shqiptare e përditshme me qendër në Tiranë." },
  { title: "Bota Sot", volume: 1, issue: 1, language: "Albanian", publish_year: 2001, category: "Academic", description: "Një gazetë shqiptare e përditshme me fokus në ngjarjet aktuale." },
  { title: "Dita", volume: 1, issue: 1, language: "Albanian", publish_year: 2005, category: "Historic", description: "Një gazetë shqiptare e përditshme e njohur për analizat e saj." },
  { title: "Shkenca", volume: 1, issue: 1, language: "Albanian", publish_year: 2000, category: "Academic", description: "Një revistë shkencore shqiptare e themeluar në Tiranë." },
  { title: "Natyra", volume: 1, issue: 1, language: "Albanian", publish_year: 2003, category: "Academic", description: "Një revistë shkencore që promovon kërkimin dhe zhvillimin në Shqipëri." },
  { title: "Ekonomia", volume: 1, issue: 1, language: "Albanian", publish_year: 2004, category: "Popular", description: "Një revistë shqiptare që trajton çështje ekonomike dhe financiare." },
  { title: "Koha", volume: 1, issue: 1, language: "Albanian", publish_year: 2006, category: "Popular", description: "Një revistë shqiptare e njohur për mbulimin e ngjarjeve kulturore." },
  { title: "Revista Shqiptare", volume: 1, issue: 1, language: "Albanian", publish_year: 2007, category: "Historic", description: "Një revistë shqiptare që promovon kulturën dhe artin." }
]

journals.each do |journal|
  Journal.find_or_create_by!(journal)
end




