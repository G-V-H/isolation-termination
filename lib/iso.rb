require 'tty-spinner'
require "tty-prompt"

prompt = TTY::Prompt.new
choices = %w(push-ups sit-ups crunches pull-ups back-flips)
work_out_picks = prompt.multi_select("Please select your workouts", choices)

# p work_out_picks


def timer(exercise, sec)

    for i in 0..exercise.length - 1
        spinner = TTY::Spinner.new("[:spinner] #{exercise[i]}", format: :pulse_2)
        spinner.auto_spin
        sleep(sec)
        spinner.success('Done!')
    end
end

timer(work_out_picks, 5)