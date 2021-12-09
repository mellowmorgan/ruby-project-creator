#!/usr/bin/ruby

# to make project directory, in terminal type ruby ruby_script.rb "name of project"
#example: ruby ruby_script.rb calculator-project

project_name = ARGV[0]
puts "creating project now"

#create project folders
system "mkdir ../#{project_name}"
system "mkdir ../#{project_name}/lib ../#{project_name}/spec"

#create project files
system "touch ../#{project_name}/lib/#{project_name}.rb"
system "touch ../#{project_name}/spec/#{project_name}_spec.rb"
system "touch ../#{project_name}/Gemfile"
system "touch ../#{project_name}/README.md"

#append Gemfile with required gems (rspec, pry)
system "echo 'source \"https://rubygems.org\"' >> ../#{project_name}/Gemfile"
system "echo 'gem \"rspec\"' >> ../#{project_name}/Gemfile"
system "echo 'gem \"pry\"'  >> ../#{project_name}/Gemfile"

#append main project file with requirments for pry gem
system "echo 'require(\"pry\")'  >> ../#{project_name}/lib/#{project_name}.rb"

#append test file with requirments for rspec and main project file
system "echo 'require(\"rspec\")' >> ../#{project_name}/spec/#{project_name}_spec.rb"
system "echo 'require(\"#{project_name}\")' >> ../#{project_name}/spec/#{project_name}_spec.rb"

#bundle install
system "( cd ../#{project_name} && bundle install )"

puts "file structure complete"


readme_text="# {Application Name}

#### Created By _**{Name}**_

#### _An application to_

## Technologies Used

* _Ruby_
* _RSpec_
* _IRB_
* _Pry_

## Description

_This project was created for Epicodus bootcamp to show proficiency in. The application is for . The user can ._

## Setup/Installation Requirements

* _Clone the GitHub [repository]({github repository}) or download and open the Zip on your local machine.

## Known Bugs

_None at this time_

## Future Updates

* __

## License

_[MIT](https://opensource.org/licenses/MIT)_
Copyright (c) _2021_ _{Name}_

## Support and Contact Details
* _[{email}](mailto:{email})_"

#append README a markdown template
system "echo '#{readme_text}' >> ../#{project_name}/README.md"