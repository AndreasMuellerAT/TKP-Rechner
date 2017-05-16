wkk = 36 # Wie viele Kreuzer sind ein Taler? (default 36)
wkp = 6 # Wie viele Pfennige sind ein Kreuzer? (default 6)

puts "Willkommen beim TKP-Kalkulator!"
puts "Der TKP-Kalkulator erlaubt es Beträge bestehend aus Talern, Kreuzern und Pfennigen mitteinander zu addieren,"
puts "und subtrahieren, sowie diese um einen Faktor zu multiplizieren oder zu dividieren."
puts "Darüber hinaus kann eine selbst errechnete Summe aus Talern, Kreuzern und Pfennigen über die (=) Funktion korrekt notiert werden."
puts "Im Anschluss kann mit dem Zwischenergebnis weitergerechnet werden oder eine neue Berechnung gestartet werden."
puts "Der Default Wechselkurs bezieht sich auf Lemgo 1656 und beträgt 1 Taler = 36 Kreuzer = 216 Pfennige."
puts "Dieser Umrechnungskurs kann im Script über die Variablen <wkk> und <wkp> individuell angepasst werden."
puts ""
puts "Wichtig: Bitte verwenden Sie nur 0 sowie ganze Zahlen zur Eingabe. Ergebnisse von Divisionen werden immer auf den letzten Pfennig abgerundet."
puts "Viel Erfolg!"

loop do
  puts "Bitte geben Sie den ersten Betrag ein!"
  puts "Wie viele Taler?"
  talerIn1 = gets.to_i
  puts "Wie viele Kreuzer?"
  kreuzerIn1 = gets.to_i
  puts "Wie viele Pfennige?"
  pfennigeIn1 = gets.to_i
  pfennigeTot1 = (talerIn1*wkk*wkp) + (kreuzerIn1*wkp) + pfennigeIn1
  loop do
    puts "Bitte wählen Sie die Rechenoperation, die Sie durchführen möchten (+), (-), (/), (*), (=)"
    op = gets.chomp
    case op
    when "+"
      puts "Bitte geben Sie den zweiten Betrag ein, den Sie addieren möchten!"
      puts "Wie viele Taler?"
      talerIn2 = gets.to_i
      puts "Wie viele Kreuzer?"
      kreuzerIn2 = gets.to_i
      puts "Wie viele Pfennige?"
      pfennigeIn2 = gets.to_i
      pfennigeTot2 = (talerIn2*wkk*wkp) + (kreuzerIn2*wkp) + pfennigeIn2
      ergebnis = pfennigeTot1.to_i + pfennigeTot2.to_i
      talerOut = ergebnis / (wkk*wkp) .floor
      kreuzerOut = (ergebnis - (talerOut*wkk*wkp)) / wkp .floor
      pfennigeOut = (ergebnis - (talerOut*wkk*wkp) - (kreuzerOut*wkp))
      puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige #{op} #{talerIn2} Taler, #{kreuzerIn2} Kreuzer und #{pfennigeIn2} Pfennige"
      puts "Ergeben #{talerOut} Taler, #{kreuzerOut} Kreuzer und #{pfennigeOut} Pfennige!"
    when "-"
      puts "Bitte geben Sie den zweiten Betrag ein, den Sie subtrahieren möchten!"
      puts "Wie viele Taler?"
      talerIn2 = gets.to_i
      puts "Wie viele Kreuzer?"
      kreuzerIn2 = gets.to_i
      puts "Wie viele Pfennige?"
      pfennigeIn2 = gets.to_i
      pfennigeTot2 = (talerIn2*wkk*wkp) + (kreuzerIn2*wkp) + pfennigeIn2
      ergebnis = pfennigeTot1.to_i - pfennigeTot2.to_i
      talerOut = ergebnis / (wkk*wkp) .floor
      kreuzerOut = (ergebnis - (talerOut*wkk*wkp)) / wkp .floor
      pfennigeOut = (ergebnis - (talerOut*wkk*wkp) - (kreuzerOut*wkp))
      puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige #{op} #{talerIn2} Taler, #{kreuzerIn2} Kreuzer und #{pfennigeIn2} Pfennige"
      puts "Ergeben #{talerOut} Taler, #{kreuzerOut} Kreuzer und #{pfennigeOut} Pfennige!"
    when "/"
      puts "Durch welchen Faktor möchten Sie dividieren?"
      divisor = gets.to_i
      ergebnis = pfennigeTot1 / divisor .round
      talerOut = ergebnis / (wkk*wkp) .floor
      kreuzerOut = (ergebnis - (talerOut*wkk*wkp)) / wkp .floor
      pfennigeOut = (ergebnis - (talerOut*wkk*wkp) - (kreuzerOut*wkp))
      puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige / #{divisor}"
      puts "Ergeben #{talerOut} Taler, #{kreuzerOut} Kreuzer und #{pfennigeOut} Pfennige!"
    when "*"
      puts "Mit welchem Faktor möchten Sie multiplizieren?"
      multiplikator = gets.to_i
      ergebnis = pfennigeTot1 * multiplikator
      talerOut = ergebnis / (wkk*wkp) .floor
      kreuzerOut = (ergebnis - (talerOut*wkk*wkp)) / wkp .floor
      pfennigeOut = (ergebnis - (talerOut*wkk*wkp) - (kreuzerOut*wkp))
      puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige * #{multiplikator}"
      puts "Ergeben #{talerOut} Taler, #{kreuzerOut} Kreuzer und #{pfennigeOut} Pfennige!"
    when "="
      ergebnis = pfennigeTot1
      talerOut = ergebnis / (wkk*wkp) .floor
      kreuzerOut = (ergebnis - (talerOut*wkk*wkp)) / wkp .floor
      pfennigeOut = (ergebnis - (talerOut*wkk*wkp) - (kreuzerOut*wkp))
      puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige sind korrekt notiert #{talerOut} Taler, #{kreuzerOut} Kreuzer und #{pfennigeOut} Pfennige!"
    else
      puts "Fehlerhafte Eingabe! Bitte verwenden Sie nur ein eines der angeführten Zeichen zur Eingabe."
      puts "Bitte starten Sie das Script neu!"
      abort
    end
    puts "Möchten Sie mit diesem Ergebnis weiterrechnen (y/n)?"
    decision = gets.chomp
    if decision == "y"
      pfennigeTot1 = ergebnis
      talerIn1 = talerOut
      kreuzerIn1 = kreuzerOut
      pfennigeIn1 = pfennigeOut
    end
    break if decision != "y"
  end
  puts "Möchten Sie eine neue Berechnung durchführen (y/n)?"
  decision2 = gets.chomp
  break if decision2 != "y"
end
puts "Auf Wiedersehen!"

#Der default verwendet Wechselkurs lautet: 1 Taler = 36 Kreuzer. 1 Kreuzer = 6 Pfennige.
#Dieser Kurs entstammt einer Rechnung eines Hexenprozesses gegen Herman Buschorn 1654 aus dem Stadtarchiv Lemgo (v.num 10106)
# http://www.archive.nrw.de/LAV_NRW/jsp/findbuch.jsp?archivNr=292&verzguid=400292000017820000146
# Zur individuellen Anpassung der Umrechnungskurse verändere entsprechend die Variablen wkk und wkp in Zeile 1, 2
# The TKP-Kalkulator was made by Andreas Müller using Atom.io. Feel free to contact me with any questions: andreas.w.mueller@outlook.com or @Andreas20239
#Free to Use
