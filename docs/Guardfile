# Encoding: utf-8

require 'colorize'

guard :shell do
  watch /(.*\.tex)/ do |m|
    print "#{Time.now.strftime("%H:%M:%S")} Working... "
    STDOUT.flush
    puts "Done ✔".green if run_command("pdflatex -interaction=nonstopmode #{m[0]}")
  end
  watch /(.*)\.bib/ do |m|
    print "#{Time.now.strftime("%H:%M:%S")} Working... " 
    STDOUT.flush
    next unless run_command("bibtex #{m[1]}")
    puts "Done" if run_command("pdflatex -halt-on-error #{m[1]}.tex")
  end
end

def run_command(command)
  output = `#{command}`
  if $? != 0
    puts "Error\n\n"
    puts output.gsub(/^/,"   ").red
    return false
  else
    return true
  end
end
