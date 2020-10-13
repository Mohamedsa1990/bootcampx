SELECT AVG(total_cohort_AR_time.total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, SUM(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students
  ON student_id = students.id
  JOIN cohorts
  ON cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY  total_duration
) AS total_cohort_AR_time;