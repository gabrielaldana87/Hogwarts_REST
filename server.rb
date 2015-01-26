require 'sinatra'
require 'pry'

students = {
  0=> {
    id:0,
    f_name: "Harry",
    l_name: "Pothead"
  }
}

counter=1

get '/students' do
  erb :index, locals: {students: students}
end

post '/student' do
  newstudent = {
    id: counter,
    f_name: params["f_name"],
    l_name: params["l_name"]
  }
  students[counter] = newstudent
  counter +=1
  redirect '/students'
end

get '/student/:id' do
  thisstudent = students[params[:id].to_i]
  erb :show, locals: {thisstudent: thisstudent}
end

put '/student/:id' do
  student=students[params[:id].to_i]
  student[:f_name] = params["newname"]
  redirect '/students'
end

delete '/student/:id' do
  students.delete(params[:id].to_i)
  redirect '/students'
end
