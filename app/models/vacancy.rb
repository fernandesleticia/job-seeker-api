class Vacancy < ApplicationRecord
    
    def self.percent_by_category
        sql = "WITH t1 AS 
        (SELECT \"categoryId\", Count(*) AS total 
         FROM vacancies
         GROUP BY \"categoryId\")
       SELECT \"categoryId\", total, 
              (0.0+total)/(COUNT(*) OVER (PARTITION BY \"categoryId\")) as percentage-- no integer divide!
       FROM t1;"
        records_array = ActiveRecord::Base.connection.exec_query(sql)
    end

end
 