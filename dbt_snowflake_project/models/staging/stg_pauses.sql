select   *
from
    {{ source('hellofresh', 'pauses') }}