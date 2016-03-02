# vim: set ft=ruby:

Pry.config.history.histignore = [
  /hist*/,
]

Pry.prompt = [
    proc { |target_self, nest_level, pry|
        "\e[46m[#{pry.input_array.size}]\e[m #{Pry.config.prompt_name}(#{Pry.view_clip(target_self)})#{":#{nest_level}" unless nest_level.zero?}> "
    }
]
