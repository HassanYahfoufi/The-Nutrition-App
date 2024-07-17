import csv
import sqlite3

def import_csv_to_db(csv_file, db_file):
    # Connect to the database (or create it)
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    # Create table if not exists
    cursor.execute('''CREATE TABLE IF NOT EXISTS food_nutrition (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        food_item TEXT,
                        calories INTEGER,
                        protein REAL,
                        fat REAL,
                        carbohydrates REAL,
                        fiber REAL,
                        sugar REAL,
                        known_hazards TEXT)''')

    # Read the CSV file
    with open(csv_file, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            cursor.execute('''INSERT INTO food_nutrition 
                              (food_item, calories, protein, fat, carbohydrates, fiber, sugar, known_hazards)
                              VALUES (?, ?, ?, ?, ?, ?, ?, ?)''',
                           (row['food_item'], row['calories'], row['protein'], row['fat'],
                            row['carbohydrates'], row['fiber'], row['sugar'], row['known_hazards']))

    # Commit the transaction and close the connection
    conn.commit()
    conn.close()

# Example usage
import_csv_to_db('food_data.csv', 'nutrition_app.db')
