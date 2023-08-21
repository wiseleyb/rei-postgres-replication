# Creates a typical table done by a non-rails dev to demonstrate
# dealing with composite keys with koyo::repl
class CreateUserInterestNonRails < ActiveRecord::Migration[7.0]
  def up
    sql = %(
      CREATE TABLE user_interests_non_rails(
        user_id INTEGER,
        interest_id INTEGER,
        created_at timestamp(6) without time zone,
        updated_at timestamp(6) without time zone,
        PRIMARY KEY (user_id, interest_id)
      );
    )
    connection.execute(sql)
  end

  def down
    sql = %(DROP TABLE user_interests_non_rails;)
    connection.execute(sql)
  end
end
