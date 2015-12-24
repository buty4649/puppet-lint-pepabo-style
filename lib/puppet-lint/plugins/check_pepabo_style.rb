PuppetLint.new_check(:multiple_include) do
  def check
    tokens.select{|t| t.type == :NAME && t.value == 'include'}
    .select{|t|
      start_line = t.line.to_i
      token = t.next_code_token

      # 改行を検出できないので#lineの違いで検出する
      while token && start_line == token.line.to_i do
        if token.type == :COMMA
          notify :warning, {
            :message => 'expected multiple include',
            :line    => token.line,
            :column  => token.column,
          }
        end
        token = token.next_code_token
      end
    }
  end
end

PuppetLint.new_check(:enclosed_reserved_words) do
  def check
    reserved_words = {
      'enable' => ['true', 'false', 'manual'],
      'ensure' => ['present', 'absent', 'file', 'directory', 'link', 'installed', 'purged', 'held', 'lates'],
      'force'  => ['true', 'false', 'yes', 'no'],
    }
    tokens.select{|t|
      t.type == :NAME && reserved_words.key?(t.value)
    }
    .select{|t|
      words = t.value
      # eg. ensure => present
      token = t.next_code_token.next_code_token
      if reserved_words[words].include? token.value
        if token.type == :SSTRING
          notify :warning, {
            :message => 'enclosed reserved words in single quotes',
            :line    => token.line,
            :column  => token.column,
          }
        end
        if token.type == :STRING
          notify :warning, {
            :message => 'enclosed reserved words in double quotes',
            :line    => token.line,
            :column  => token.column,
          }
        end
      end
    }
  end
end
