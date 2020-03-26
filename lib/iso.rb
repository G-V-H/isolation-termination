require 'tty-spinner'
require 'tty-prompt'

prompt = TTY::Prompt.new
choices = %w(push-ups sit-ups crunches pull-ups back-flips)
work_out_picks = prompt.multi_select("Please select your workouts", choices)

#prompt user for length of time in seconds for each exercise
work_out_length = prompt.ask("How many seconds would you like to do for each exercise?") do |q|
    q.required true
    q.validate /\A[0-9]+\Z/ 
    q.modify :int
  end
#prompt user for difficulty (easy, medium, hard) will set rest time (30 1, 20 2, 10 3)

choices = %w(Easy Medium Hard)
work_out_dif = prompt.multi_select("Please select your workouts", choices)

if work_out_dif[0] == "Easy"
    sets = 1
elsif work_out_dif[0] == "Medium"
    sets = 2
else
    sets = 3
    p "no"
end


def timer(exercise, sec, rest)

    for i in 0..exercise.length - 1
        spinner = TTY::Spinner.new("[:spinner] #{exercise[i]}", format: :pulse_2)
        spinner.auto_spin
        sleep(sec.to_i)
        spinner.success('Done!')

        if rest == "Easy"
            rest(3)
        elsif rest == "Medium"
            rest(3)
        else
            rest(3)
        end

    end
end

def rest(sec)
    rester = TTY::Spinner.new("[:spinner] Have a rest!")
    rester.auto_spin
    sleep(sec)
    rester.success('Done!')
end

for i in 0..sets - 1
    puts "Set #{i+1}"
    timer(work_out_picks, work_out_length, work_out_dif)
end