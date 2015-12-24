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
