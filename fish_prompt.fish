# Copyright 2019 Luca Filipozzi

function fish_prompt

  # variables
  set nonzero_exit [ $status -ne 0 ]
  set user_is_root [ (command id -u) -eq 0 ]
  set host (command hostname -s)
  set user (command whoami)
  set path (prompt_pwd)

  # utility function
  function fmt -a bgc -a fgc -a str
    set_color -b $bgc; set_color $fgc
    echo -n -s "$str"
  end

  # prompt component: user@host
  fmt normal yellow "$user"
  fmt normal normal '@'
  fmt normal green "$host"
  fmt normal normal ':'

  # prompt component: path
  fmt normal blue "$path"
  fmt normal normal ''

  # prompt component: mark
  $nonzero_exit; and set fgc red; or set fgc white
  $user_is_root; and set str '#'; or set str '$'
  fmt normal $fgc $str
  fmt normal normal ' '

end
