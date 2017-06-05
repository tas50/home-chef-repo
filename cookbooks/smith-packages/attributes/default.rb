default['smith-packages']['install'] = if platform?('debian')
                                         %w(iotop unzip curl wget libxml2-dev zlib1g-dev)
                                       else
                                         %w(iotop unzip curl wget ruby2.3-dev libxml2-dev zlib1g-dev)
                                       end
default['smith-packages']['remove'] = %w(popularity-contest whoopsie landscape-common command-not-found command-not-found-data)
