require 'glimmer-dsl-libui'
load 'index.rb'
include Glimmer



window('Tomato Time', 300, 450){
  button('Start Timer'){
    on_clicked do
      TomatoTimer.new.start_timer
    end
  }
}.show