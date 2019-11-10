# Copyright 2019 Luca Filipozzi

function fish_right_prompt

  # utility function
  function fmt -a bgc -a fgc -a str
    set_color -b $bgc; set_color $fgc
    echo -n -s "$str"
  end

  # prompt component: virtual environment
  if [ -n "$VIRTUAL_ENV" ]
    fmt normal normal \uF820' '
    fmt normal yellow (basename "$VIRTUAL_ENV")
    fmt normal normal ' '
  end

  # prompt component: git porcelain
  command porcelain

end
