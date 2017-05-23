=begin
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
=end
class Amount
  $wkk = 36
  $wkp = 6
  def initialize(talerIn, kreuzerIn, pfennigeIn)
    @talerIn = talerIn
    @kreuzerIn = kreuzerIn
    @pfennigeIn = pfennigeIn
    @pfenTot = @talerIn*$wkk*$wkp + @kreuzerIn*$wkp + @pfennigeIn
    @talerOut = @pfenTot / ($wkk*$wkp) .floor
    @kreuzerOut = (@pfenTot - (@talerOut*$wkk*$wkp)) / $wkp .floor
    @pfennigeOut = (@pfenTot - (@talerOut*$wkk*$wkp) - (@kreuzerOut*$wkp))
  end
  def totErg
    puts "Das Ergebnis lautet #{@talerOut} Taler, #{@kreuzerOut} Kreuzer, #{@pfennigeOut} Pfennige!"
  end
  def totPret
    return @pfenTot
  end
end

#loop do
  puts "Bitte geben Sie den ersten Betrag ein! (Taler, Kreuzer, Pfennige)"
  Am1 = Amount.new(gets.to_i, gets.to_i, gets.to_i)
  #loop do
    puts "Bitte wählen Sie die Rechenoperation, die Sie durchführen möchten (+), (-), (/), (*), (=)"
    op = gets.chomp
    case op
    when "+"
      puts "Bitte geben Sie den zweiten Betrag ein, den Sie addieren möchten! (Taler, Kreuzer, Pfennige)"
      Am2 = Amount.new(gets.to_i, gets.to_i, gets.to_i)
      Am3 = Amount.new(0, 0, Am1.totPret + Am2.totPret)
      #puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige #{op} #{talerIn2} Taler, #{kreuzerIn2} Kreuzer und #{pfennigeIn2} Pfennige"
      Am3.totErg
    when "-"
      puts "Bitte geben Sie den zweiten Betrag ein, den Sie subtrahieren möchten!"
      Am2 = Amount.new(gets.to_i, gets.to_i, gets.to_i)
      Am3 = Amount.new(0, 0, Am1.totPret - Am2.totPret)
      #puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige #{op} #{talerIn2} Taler, #{kreuzerIn2} Kreuzer und #{pfennigeIn2} Pfennige"
      Am3.totErg
    when "/"
      puts "Durch welchen Faktor möchten Sie dividieren?"
      divisor = gets.to_i
      Am3 = Amount.new(0, 0, Am1.totPret / divisor)
      #puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige / #{divisor}"
      Am3.totErg
    when "*"
      puts "Mit welchem Faktor möchten Sie multiplizieren?"
      multiplikator = gets.to_i
      Am3 = Amount.new(0, 0, Am1.totPret * multiplikator)
      #puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige * #{multiplikator}"
      Am3.totErg
    when "="
      #puts "#{talerIn1} Taler, #{kreuzerIn1} Kreuzer und #{pfennigeIn1} Pfennige sind korrekt notiert #{talerOut} Taler, #{kreuzerOut} Kreuzer und #{pfennigeOut} Pfennige!"
      Am1.totErg
    else
      puts "Fehlerhafte Eingabe! Bitte verwenden Sie nur ein eines der angeführten Zeichen zur Eingabe."
      puts "Bitte starten Sie das Script neu!"
      abort
    end
=begin
    puts "Möchten Sie mit diesem Ergebnis weiterrechnen (y/n)?"
    decision = gets.chomp
    if decision == "y"
      Am1 = Am3
    end
    break if decision != "y"
  end
  puts "Möchten Sie eine neue Berechnung durchführen (y/n)?"
  decision2 = gets.chomp
  break if decision2 != "y"
end
=end
puts "Auf Wiedersehen!"



#Der default verwendet Wechselkurs lautet: 1 Taler = 36 Kreuzer. 1 Kreuzer = 6 Pfennige.
#Dieser Kurs entstammt einer Rechnung eines Hexenprozesses gegen Herman Buschorn 1654 aus dem Stadtarchiv Lemgo (v.num 10106)
# http://www.archive.nrw.de/LAV_NRW/jsp/findbuch.jsp?archivNr=292&verzguid=400292000017820000146
# Zur individuellen Anpassung der Umrechnungskurse verändere entsprechend die Variablen wkk und wkp in Zeile 1, 2
# The TKP-Kalkulator was made by Andreas Müller using Atom.io. Feel free to contact me with any questions: andreas.w.mueller@outlook.com or @Andreas20239
#Free to Use
