with r as (
    select * from {{ ref('fct_reviews') }}
), l as (
    select * from {{ ref('dim_listings_cleansed') }}
)

select * from r
inner join l on r.listing_id = l.listing_id
where r.review_date < l.created_at

