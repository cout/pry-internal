require 'internal/method'

Pry::Commands.block_command "disassemble", "Disassemble a method" do |class_and_method|
  method = Pry::Method.from_str(class_and_method)

  str = method.body.disasm
  lines = str.split("\n")
  
  # == disasm: <RubyVM::InstructionSequence:foo@(pry)>======================
  lines[0].gsub!(/=+/) { |s| text.green(s) }
  lines[0].gsub!(/<(.*?)@(.*?)>/) { '<' + colorize_code($1) + '@' + text.bold($2) + '>' }

  # 0000 trace            8                                               (   1)
  # 0002 trace            1
  # 0004 putobject        1
  # 0006 putobject        1
  # 0008 opt_plus         <ic:1>
  # 0010 trace            16
  # 0012 leave            
  for i in 1..lines.length do
    lines[i] = colorize_code(lines[i]) # TODO: not the best way to do this
    lines[i].gsub!(/^(.*?)(\s+)(.*?)(\s+)/) { $1 + $2 + text.cyan($3) + $4 }
    lines[i].gsub!(/<(.*?):(.*?)>/) { '<' + text.bright_blue($1) + ':' + $2 + '>' }
  end
  
  puts lines.join("\n")
end

Pry::Commands.alias_command 'disasm', 'disassemble'

