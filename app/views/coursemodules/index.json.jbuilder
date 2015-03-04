json.array!(@coursemodules) do |coursemodule|
  json.extract! coursemodule, :id, :module_name, :module_code, :course_code, :start_time, :end_time
  json.start coursemodule.start_time
  json.end coursemodule.end_time
  json.url coursemodule_url(coursemodule, format: :html)
end