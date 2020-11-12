-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE loom_videos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    description TEXT DEFAULT '',
    link TEXT NOT NULL UNIQUE,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
