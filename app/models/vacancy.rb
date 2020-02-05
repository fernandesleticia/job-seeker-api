class Vacancy < ApplicationRecord

    validates_presence_of :partnerId, :title, :categoryId, :expiresAt
    
    def self.percent_by_category categoryId

        @connection = ActiveRecord::Base.connection

        sql = "WITH t1 AS 
        (SELECT \"categoryId\", Count(*) AS total 
         FROM vacancies
         WHERE \"categoryId\" = #{categoryId}
         GROUP BY \"categoryId\")
       SELECT \"categoryId\", total, 
              (0.0+total)/(COUNT(*) OVER (PARTITION BY \"categoryId\")) as percentage-- no integer divide!
       FROM t1;"

       records = @connection.exec_query(sql)
   
    end

end
 