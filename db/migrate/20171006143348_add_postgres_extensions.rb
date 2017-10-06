class AddPostgresExtensions < ActiveRecord::Migration[5.1]
  def up
    %{
      CREATE EXTENSION pg_trgm;
      CREATE EXTENSION fuzzystrmatch;
    }
  end

  
  def down
    %{
      DROP EXTENSION pg_trgm;
      DROP EXTENSION fuzzystrmatch;
    }
  end
end
