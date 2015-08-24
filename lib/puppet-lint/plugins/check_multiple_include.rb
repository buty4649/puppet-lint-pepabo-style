PuppetLint.new_check(:multiple_include) do
  def check
    if tokens.first.value == "include"
      tokens.select {|t| t.type == :COMMA}.each {|t|
        next_token = t.next_code_token
        notify :warning, {
          :message => 'expected multiple include',
          :line    => next_token.line,
          :column  => next_token.column,
        }
      }
    end
  end
end
