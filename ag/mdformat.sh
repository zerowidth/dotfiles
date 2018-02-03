# format ag output for markdown
alias mdformat='ruby -lne '\''x, y = $_.split(/\s+/,2); puts "* #{x} `#{y}`"'\'''
